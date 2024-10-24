class Transactionmodel {
  String judul;
  String deskripsi;
  String gambar;
  String nominal;

  Transactionmodel({required this.judul, required this.deskripsi, required this.gambar, required this.nominal});

  static List <Transactionmodel> getTransactionmodel() {
    List<Transactionmodel> transModel = [];

    transModel.add(
      Transactionmodel(
        judul: "Spotify",
        deskripsi: "Music streaming service",
        gambar: "assets/images/SpotifyLogo.png", 
        nominal: "-\$ 9.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Netflix",
        deskripsi: "Video streaming service",
        gambar: "assets/images/NetflixLogo.png", 
        nominal: "-\$ 15.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Adobe Photoshop",
        deskripsi: "Photo editing software",
        gambar: "assets/images/adobePhotoshopLogo.png", 
        nominal: "-\$ 20.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Microsoft Office 365",
        deskripsi: "Productivity suite",
        gambar: "assets/images/microsoftLogo.png", 
        nominal: "-\$ 99.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Apple Music",
        deskripsi: "Music streaming service",
        gambar: "assets/images/Apple_Music_icon.svg.png", 
        nominal: "-\$ 9.99",
      ),
    );
  return transModel;
}}