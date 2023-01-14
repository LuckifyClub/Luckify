import { Dialog } from 'quasar';
import AlertDialog from 'components/common-dialogs/AlertDialog';

export function dialog({
  cancel = false,
  persistent = false,
  type = 'error',
  title = 'UYARI',
  message,
  kapatText = 'Tamam',
  cancelText = 'İptal',
  evetText = 'Evet',
}) {
  return Dialog.create({
    component: AlertDialog,
    message,
    title,
    type,
    cancel,
    persistent,
    kapatText,
    cancelText,
    evetText,
  });
}
