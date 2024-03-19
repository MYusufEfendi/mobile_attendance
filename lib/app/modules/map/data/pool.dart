class Pool {
  final List<Data>? data;

  Pool({
    this.data,
  });

  Pool.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? x;
  final String? namaPerusahaan;
  final String? alamat;
  final String? y;

  Data({
    this.id,
    this.x,
    this.namaPerusahaan,
    this.alamat,
    this.y,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        x = json['x'] as String?,
        namaPerusahaan = json['nama_perusahaan'] as String?,
        alamat = json['alamat'] as String?,
        y = json['y'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'x' : x,
    'nama_perusahaan' : namaPerusahaan,
    'alamat' : alamat,
    'y' : y
  };
}