Feature: Flujo Screenplay completo usando CSV

  Background:
    * call read('classpath:screenplay/actors/PetOwner.feature')
    * def pets = read('classpath:petstore/data/pets.csv')
    * print 'Datos CSV cargados:', pets

  Scenario: E2E completo con patrón Screenplay
    * def ejecutarFlujo =
  """
  function(pet){
    karate.call('classpath:screenplay/tasks/AddPet.feature', { petId: pet.id, name: pet.name, status: pet.status });
    karate.call('classpath:screenplay/tasks/GetPet.feature', { petId: pet.id });
    karate.call('classpath:screenplay/tasks/UpdatePet.feature', { petId: pet.id, name: pet.name, status: pet.status });
    karate.call('classpath:screenplay/questions/VerifyPetStatus.feature', { petId: pet.id, expectedStatus: pet.status });
    karate.call('classpath:screenplay/tasks/DeletePet.feature', { petId: pet.id });
  }
  """

    * karate.forEach(pets, ejecutarFlujo)
