// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract lottery{
    enum LOTTERY_STATE { OPEN, CLOSED}

    struct Instance {
        uint256 id;
        string title;
        string image;
        uint256 ticket_count;
        uint256 ticket_price; // In wei
        // uint256 start_date;
        // uint256 end_date;
        uint256 award_count;
        // uint256[] award_ratio_list;
        // uint256 payoff_count;
        // uint256 payoff_price;
        // address[] marketing_addresses;
        // uint256[] marketing_ratios;
        LOTTERY_STATE state;

    }

    mapping(uint256 => Instance) public instance;
    uint256 public activeInstance; // State machine for administrative purposes

    mapping(uint256 => address[]) private participants;
    mapping(uint256 => address[]) private award_winners;

    // Administrative
    address public organizer;
    mapping(address => bool) public authorized;

    uint256 raffleDate;
    address[] private players;
    mapping(address=>bool) alreadyParticipated;
    uint lotteryID=0;
    mapping (uint=>address) private winners;
    mapping (uint256 => bool) public usedWords;
    mapping (uint => bool) public usedNumbers;

    LOTTERY_STATE private lottery_state;

    constructor(){
        organizer=msg.sender;
        lottery_state = LOTTERY_STATE.CLOSED;
    }

    function createInstance(uint256 _id,
                            string memory _title)
    public onlyAdmin
    {
        instance[_id] = Instance(_id,
                                 _title,
                                 "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
                                 1000,
                                 10000000000000,
                                 1, //award_count
                                 LOTTERY_STATE.OPEN
                                 );
    }

    function getInstance(uint256 _id) public view returns (Instance memory) {
        return instance[_id];
    }

    function setRaffleDate(uint256 _raffleDate) public onlyAdmin {
        // require(msg.sender == owner, "Only the owner can set the raffle date.");
        raffleDate = _raffleDate;
    }

    function getRaffleDate() public view returns (uint256) {
        return raffleDate;
    }

    function open_lottery() public onlyAdmin{
        lottery_state= LOTTERY_STATE.OPEN;
        lotteryID=lotteryID+1;
    }

    // function enter(uint256 _id) public payable isOpen {
    function enter(uint256 _id) public payable {
        require(instance[_id].id > 0, "Luckify does not exist");
        require(instance[_id].state==LOTTERY_STATE.OPEN, "Luckify is still closed");
        require(msg.value == .00001 ether, "0.00001 ETH required"); //10000 Gwei
        // require(alreadyParticipated[msg.sender]==false,"Address already participated");
        // require(msg.sender!=organizer,"organizer cannot participate");
        // alreadyParticipated[msg.sender]=true;
        players.push(msg.sender);
        participants[_id].push(msg.sender);
    }

    function resetPlayers() private{
        for (uint i=0; i<players.length; i++){
            alreadyParticipated[players[i]]=false;
        }
    }

    function generateAsset(string memory _seedPhrase) public returns (uint256) {
        uint256 word;
        do {
            // word = getAssetNumber(_seedPhrase);
            word = 100000000 + uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players, _seedPhrase))) % 99999999;
        } while (usedWords[word]);
        usedWords[word] = true;
        return word;
    }


    // function getAssetNumber(string memory _seedPhrase) internal view returns (uint256) {
    //     return 100000000 + uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players, _seedPhrase))) % 99999999;
    // }

    function randomize(string memory _seedPhrase) private view returns (uint){
      return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players, _seedPhrase)));
    }

    function getThreeRandomNumbers(string memory _seedPhrase) public returns (uint[3] memory) {
        uint[3] memory randomNumbers;
        for (uint i = 0; i < 3; i++) {
            uint randomNumber;
            do {
                randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players, _seedPhrase))) % players.length;
            } while (usedNumbers[randomNumber]);
            randomNumbers[i] = randomNumber;
            usedNumbers[randomNumber] = true;
        }
        return randomNumbers;
    }

    function pickWinner2(string memory _seedPhrase, uint256 _id) public onlyAdmin{
        require(bytes(_seedPhrase).length!=0, "Must enter SeedPhrase");
        require(instance[_id].state==LOTTERY_STATE.OPEN, "Luckify is still closed");
        uint index= randomize(_seedPhrase) % participants[_id].length;
        award_winners[_id]=participants[_id][index];
        payable(organizer).transfer((address(this).balance)/40);
        payable(participants[_id][index]).transfer(address(this).balance);
        resetPlayers();
        players= new address[](0);
        lottery_state=LOTTERY_STATE.CLOSED;
    }

    function pickWinner(string memory _seedPhrase) public onlyAdmin isOpen{
        require(bytes(_seedPhrase).length!=0, "Must enter SeedPhrase");
        uint index= randomize(_seedPhrase) % players.length;
        winners[lotteryID]=players[index];
        payable(organizer).transfer((address(this).balance)/40);
        payable(players[index]).transfer(address(this).balance);
        resetPlayers();
        players= new address[](0);
        lottery_state=LOTTERY_STATE.CLOSED;
    }

    function getWinners(uint _lotteryid) public view returns (address){
        return winners[_lotteryid];
    }

    function getPlayers() public view returns(address[] memory){
        return players;
    }

    function addAuthorized(address _toAdd) onlyAdmin public {
        require(_toAdd != address(0x0));
        authorized[_toAdd] = true;
    }

    // function removeAuthorized(address _toRemove) onlyAdmin public {
    //     require(_toRemove != address(0x0));
    //     require(_toRemove != msg.sender);
    //     authorized[_toRemove] = false;
    // }

    modifier onlyAdmin() {
        require(msg.sender==organizer, "You're not the organizer");
        _;
    }

    modifier onlyAuthorized() {
        require(authorized[msg.sender] || organizer == msg.sender);
        _;
    }

    modifier isOpen(){
        // require(instance[_id].state==LOTTERY_STATE.OPEN, "Lottery is still closed");
        _;
    }

    // modifier isOpen(){
    //     require(lottery_state==LOTTERY_STATE.OPEN, "Lottery is still closed");
    //     _;
    // }


    function uint2str(
    uint256 _i
    )
    internal
    pure
    returns (string memory str)
    {
    if (_i == 0)
    {
        return "0";
    }
    uint256 j = _i;
    uint256 length;
    while (j != 0)
    {
        length++;
        j /= 10;
    }
    bytes memory bstr = new bytes(length);
    uint256 k = length;
    j = _i;
    while (j != 0)
    {
        bstr[--k] = bytes1(uint8(48 + j % 10));
        j /= 10;
    }
    str = string(bstr);
    }


}
