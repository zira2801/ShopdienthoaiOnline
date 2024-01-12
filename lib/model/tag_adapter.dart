import 'package:hive/hive.dart';
import 'package:shop/model/tag.dart';

class TagAdapter extends TypeAdapter<Tag> {
  @override
  final int typeId = 0; // Bạn có thể đặt typeId này thành một số duy nhất.

  @override
  Tag read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final price = reader.readDouble();
    return Tag(id: id, title: title, price: price);
  }

  @override
  void write(BinaryWriter writer, Tag obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeDouble(obj.price);
  }
}
