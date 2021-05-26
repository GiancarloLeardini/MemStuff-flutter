const kRequiredField = 'Campo obrigatório';
const kInvalidPhone = 'Telefone precisa ter 13 ou 14 numeros';

class ValidatorHelper {
  static String isEmptyText(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else
      return null;
  }

  static String isEmptyPhone(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else if (text.length < 13 && text.length > 14)
      return kInvalidPhone;
    else
      return null;
  }

}
