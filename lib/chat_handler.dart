




class ChatHandler {


  String handleChat(String message){

    message=message.toLowerCase();

    String tx='';
    if(message.contains('need')&&message.contains('leave')){

      if(message.contains('sick')){
        tx='ok I will arrange a sick leave for you only for today.';
      }
      else if(message.contains('casual')){
        tx='Please select the leave date range <Send a date selection link in chat>???';
      }
      else {
        tx='which type of leave do you want ???';
      }

      // else {
      //   var splt = message.split('need');
      //   tx = 'Ok I will give you ${splt[1]} as soon as possible';
      // }
    }








    else if(message.contains('need')){

        var splt = message.split('need');
        tx = 'Ok I will give you ${splt[1]} as soon as possible';

    }





    else if(message.contains('hi')){
      tx='hallow, How are you ???';
    }
    // else if(message.contains('leave')){
    //   tx='which type of leave do you want ????';
    // }


    else if(message.contains('thank')){
      tx='welcome, Keep me in touch dear';
    }
    else{
      tx=message;
    }


    return tx;
  }

}