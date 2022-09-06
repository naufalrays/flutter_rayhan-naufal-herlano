class Car {
  int max_load = 2000;
  List animals = ['Sapi', 'Kambing', 'Domba'];

  List addAnimals(int max_load, int car_load) {
    if (max_load - car_load >= 600) {
      animals.add('Kerbau');
    }
    return animals;
  }

  int totalLoad(Map<String, int> weight, List animals, int car_load) {
    weight.forEach((key, value) {
      for (String animal in animals) {
        if (animal == key) {
          car_load += value;
        }
      }
    });
    return car_load;
  }
}
