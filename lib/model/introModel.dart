class Intromodel {
  String linkGambar, judul, deskripsi;

  Intromodel({
    required this.linkGambar,
    required this.judul,
    required this.deskripsi,
  });

  static List<Intromodel> getIntroModel() {
    List<Intromodel> introModel = [];
    introModel.add(
      Intromodel(linkGambar: "assets/images/vector01.png",
      judul: "Pembayaran Tercepat di Dunia",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      ),
    );
    introModel.add(
      Intromodel(linkGambar: "assets/images/vector02.png",
      judul: "Mudah untuk digunakan",
      deskripsi: "Pellentesque vel justo eget felis sodales tincidunt. In vitae turpis massa sed elementum tempus egestas sed. Pellentesque vel justo eget felis sodales tincidunt. In vitae turpis massa sed elementum tempus egestas sed",),
    );
    introModel.add(
      Intromodel(linkGambar: "assets/images/vector03.png",
      judul: "Pembayaran sangat Mudah dan Cepat",
      deskripsi: "Mauris non urna vitae nisl pretium volutpat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",),
    );
    return introModel;
  }
}
