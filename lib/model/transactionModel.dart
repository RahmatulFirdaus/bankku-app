class Transactionmodel {
  String judul;
  String deskripsi;
  String gambar;
  String nominal;

  Transactionmodel({required this.judul, required this.deskripsi, required this.gambar, required this.nominal});

  List <Transactionmodel> getTransactionmodel() {
    List<Transactionmodel> transModel = [];

    transModel.add(
      Transactionmodel(
        judul: "Spotify",
        deskripsi: "Music streaming service",
        gambar: "https://upload.wikimedia.org/wikipedia/commons/2/26/Spotify_logo_with_text.svg", // URL logo Spotify
        nominal: "-\$ 9.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Netflix",
        deskripsi: "Video streaming service",
        gambar: "https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg", // URL logo Netflix
        nominal: "-\$ 15.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Adobe Photoshop",
        deskripsi: "Photo editing software",
        gambar: "https://upload.wikimedia.org/wikipedia/commons/a/af/Adobe_Photoshop_CC_icon.svg", // URL logo Photoshop
        nominal: "-\$ 20.99",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Microsoft Office 365",
        deskripsi: "Productivity suite",
        gambar: "https://store-images.s-microsoft.com/image/apps.31863.9007199267161390.f6c0dcf0-421c-431c-b3a7-74acbba4ee22.9e1136d1-6b50-4a06-a181-ad8e3152a63a", // URL logo Office 365
        nominal: "-\$ 99.99/year",
      ),
    );
    transModel.add(
      Transactionmodel(
        judul: "Apple Music",
        deskripsi: "Music streaming service",
        gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR02JZtnsWhU5MNlciGRCbRZrK_1iLh9eq4Qw&s", // URL logo Apple Music
        nominal: "-\$ 9.99",
      ),
    );
  return transModel;
}}