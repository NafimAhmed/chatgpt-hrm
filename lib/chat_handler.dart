




class ChatHandler {


  String handleChat(String message){

    String tx='';
    if(message.contains('need')){
      var splt= message.split('need') ;
      tx='Ok I will give you ${splt[1]} as soon as possible';
    }
    else if(message.contains('hi')){
      tx='hallow, How are you ???';
    }
    else if(message.contains('thank')){
      tx='welcome, Keep me in touch dear';
    }
    else{
      tx=message;
    }


    return tx;
  }

}