

class Validator {
  static bool dateValidator(String date){
    try{
      var data = date.split("/");
      if(data[0].length == 4 && data[1].length == 2 && data[2].length == 2){
        return true;
      }
    }catch(e){
      return false;
    }
    return false;
  }
}