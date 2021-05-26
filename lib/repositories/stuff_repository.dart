import '../models/stuff_model.dart';

abstract class StuffRepository {
  Future create(StuffModel stuff);
  Future<List<StuffModel>> readAll();
  Future<StuffModel> readById(int id);
  Future update(StuffModel stuff);
  Future delete(StuffModel stuff);
}
