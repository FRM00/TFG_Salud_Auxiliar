/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleInicioSesion{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleIniciarSesion = GoogleSignIn();


  iniciarSesionGoogle() async {
    try{
      final GoogleSignInAccount? googleSignInAccount =
            await googleIniciarSesion.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credenciales = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
          await auth.signInWithCredential(credenciales);
       }
    } on FirebaseAuthException catch (e){
      print(e.message);
    }
  }

  logOutGoogle() async {
    await auth.signOut();
    await googleIniciarSesion.signOut();
  }

}

