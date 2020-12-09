# require 'faker'
number = 1

while number <= 10
  rand_text = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  quantity = rand(0..100)
  valor = rand(100..100_000)
  entity = ['organização social', 'administração federal direta', 'administração federal indireta'].sample
  role = ['Receita Federal', 'Solicitante'].sample
  status = ['disponível', 'reservado', 'indisponivel'].sample

  categories = ['veiculo', 'computador', 'celular', 'vestuario', 'moto', 'utilitario', 'brinquedo', 'jogo', 'acessorio', 'eletronico']
  category = categories.sample
  car_brand = ['fiat', 'gm', 'vw', 'honda', 'renault', 'toyota'].sample
  computer_brand = ['lenovo', 'apple', 'acer', 'samsung', 'HP', 'dell'].sample
  cellphone_brand = ['samsung', 'apple', 'xiaomi', 'motorola', 'LG'].sample
  aparell_brand = ['YSL', 'hermes', 'gap', 'dior', 'prada', 'gucci', 'chanel'].sample
  moto_brand = ['honda', 'yamaha', 'bmw', 'triumph', 'ducatti', 'KTM'].sample
  utilitary_brand = ['ford', 'dodge', 'gm', 'mitsubishi', 'nissan'].sample
  toy_brand = ['estrela', 'hot wheels', 'fisher-price', 'chicco', 'playskool'].sample
  game_brand = ['playstation', 'xbox', 'nintendo', 'puzzle grow', 'wii'].sample
  accessory_brand = ['victoria secrets', 'colcci', 'YSL', 'louis vuitton'].sample
  eletronic_brand = ['sony', 'marantz', 'bose', 'pionner', 'aiwa'].sample

  if category == categories[0]
    brand = car_brand
    catid = 1
  elsif category == categories[1]
    brand = computer_brand
    catid = 2
  elsif category == categories[2]
    brand = cellphone_brand
    catid = 3
  elsif category == categories[3]
    brand = aparell_brand
    catid = 4
  elsif category == categories[4]
    brand = moto_brand
    catid = 5
  elsif category == categories[5]
    brand = utilitary_brand
    catid = 6
  elsif category == categories[6]
    brand = toy_brand
    catid = 7
  elsif category == categories[7]
    brand = game_brand
    catid = 8
  elsif category == categories[8]
    brand = accessory_brand
    catid = 9
  elsif category == categories[9]
    brand = eletronic_brand
    catid = 10
  end


  user = User.create(cpf: "123456789#{number}",
                     first_name: rand_text,
                     last_name: rand_text,
                     email: "a#{number}@email.com",
                     password: "123123",
                     cnpj: "000000000001#{number}",
                     address: rand_text,
                     entity_type: entity.capitalize,
                     role: role.capitalize,
                     name: rand_text)

  product = Product.create(name: rand_text.capitalize,
                           brand: brand.capitalize,
                           description: rand_text,
                           address: rand_text,
                           quantity: quantity,
                           status: status.capitalize,
                           value: valor,
                           category_id: catid)

  category = Category.create(name: categories[number])
  # puts bike.valid?.to_s
  # puts "bike#{number}@email.com"
  # puts "Seed for user: #{user.id} Mr(s) #{bike.name.upcase} - Address: #{bike.address}"
  number += 1
end
