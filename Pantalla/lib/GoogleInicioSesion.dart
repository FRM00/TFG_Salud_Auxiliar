
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

