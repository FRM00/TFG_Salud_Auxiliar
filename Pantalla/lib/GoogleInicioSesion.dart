
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

/*
getCorreoFirebase() async{
  FirebaseDatabase.instance.reference();
}
*/
}

/*
class Usuario {
  String correoElectronico;
  String contrasenaPass;

  Usuario(this.correoElectronico, this.contrasenaPass);
/*
  factory Usuario.fromFireStore(DocumentSnapshot snapshot) {
    Object? user = snapshot.data();
    return Usuario(user);
    //return null;
  }*/
}*/









