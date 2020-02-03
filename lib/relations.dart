const Relation dualRelation = Relation(name: "Дуальные", longName: "Тождественные отношения", moto: "Всегда дополнят", rating: 5);
const Relation activationRelation = Relation(name: "Активация", longName: "Отношения активации", moto: "Хорошо отдыхается", rating: 4);
const Relation businessRelation = Relation(name: "Деловые", longName: "Деловые отношения", moto: "Надежные товарищи ", rating: 4);
const Relation conflictRelation = Relation(name: "Конфликтные", longName: "Конфликтные отношения", moto: "Возможны конфликты", rating: 1);
const Relation controlRelation = Relation(name: "Контролер", longName: "Отношения социальной ревизии", moto: "Подконтрольный ", rating: 1);
const Relation customerRelation = Relation(name: "Заказчик", longName: "Отношения социального заказа", moto: "Завоевывает внимание", rating: 2);
const Relation mirageRelation = Relation(name: "Миражные", longName: "Миражные отношения", moto: "Приятно отдыхается ", rating: 4);
const Relation mirrorRelation = Relation(name: "Зеркальные", longName: "Зеркальные отношения", moto: "Конструктивная критика", rating: 2);
const Relation performerRelation = Relation(name: "Исполнитель", longName: "Отношения социального заказа", moto: "Любит учить жизни", rating: 2);
const Relation quasiRelation = Relation(name: "Квазитождество", longName: "Отношения квазитождества", moto: "Частое недопонимание", rating: 2);
const Relation semiDualRelation = Relation(name: "Полудуал", longName: "Полудуальные отношения", moto: "Тонизируют ", rating: 4);
const Relation superegoRelation = Relation(name: "Суперэго", longName: "Отношения суперэго", moto: "Взаимная симпатия", rating: 3);
const Relation underControlRelation =
    Relation(name: "Подконтрольный", longName: "Отношения социальной ревизии", moto: "Покровительствует ", rating: 1);
const Relation oppositeRelation =
    Relation(name: "Противоположность", longName: "Отношения противоположности", moto: "Изменчивы в отношениях", rating: 2);
const Relation equalRelation = Relation(name: "Тождественные", longName: "Тождественные отношения", moto: "Всегда поймут", rating: 4);
const Relation familyRelation = Relation(name: "Родственные", longName: "Родственные отношения", moto: "Любимы на расстоянии ", rating: 4);

class Relation {
  final String name;
  final String longName;
  final String moto;
  final double rating;

  const Relation({this.name, this.longName, this.moto, this.rating});
}
