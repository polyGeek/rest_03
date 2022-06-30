import 'package:flutter/material.dart';
import 'package:rest_03/model/utils/network_helper.dart';



class Loading extends StatelessWidget {

  final String msg;

  const Loading( { required this.msg } );

  @override
  Widget build( BuildContext context ) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text( msg,
            style: const TextStyle( fontSize: 20 ),
          ),

          const SizedBox( height: 20,),

          const CircularProgressIndicator(
            semanticsLabel: 'Circular progress indicator',
          ),

        ],
      ),
    );
  }
}

class LoadingError extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        const Text( 'ERROR',
          textAlign: TextAlign.center,
        ),

        Text( NetworkHelper.lastErrorMsg,
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}