
# Cria um usuário da Receita para manipular as Ordens
# Atende criterios de validacao do modelo e schema: email unico, cpf com 11 e cnpj com 14 digitos
user = User.create(cpf: "12345678911",
                   first_name: 'Servidor',
                   last_name: 'publico',
                   email: "Servidor.rfb@email.com",
                   password: "123123",
                   cnpj: "00000000000191",
                   address: "Esplanada dos Ministérios, Ministério da Economia, 7o andar",
                   entity_type: 'órgão público',
                   role: 'RFB',
                   entity_name: 'Ministerio da Economia')

number = 10

while number < 20
  rand_text = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
  entity_type = ['organização da sociedade civil', 'órgão público'].sample
  entity_name = ['AACD', 'Exército', 'Polícia', 'Hospital'].sample
  cnpj = rand.to_s[2..15]
  cpf = rand.to_s[2..12]
  categories = ['veículo', 'computador', 'celular', 'vestuário', 'motocicleta', 'utilitário', 'brinquedo', 'jogo', 'acessório', 'eletrônico']

# Cria 10 usuarios externos de entidades
# Atende criterios de validacao do modelo e schema: email unico, cpf com 11 e cnpj com 14 digitos
  user = User.create(cpf: cpf,
                     first_name: rand_text.capitalize,
                     last_name: rand_text.reverse,
                     email: "a#{number + 123}@email.com",
                     password: "123123",
                     cnpj: cnpj,
                     address: "Rua #{rand_text.reverse.upcase}, Numero #{number}45",
                     entity_type: entity_type.capitalize,
                     role: "Solicitante",
                     entity_name: entity_name)

# Cria as 10 categorias
  category = Category.create(name: categories[number - 10].capitalize)

# cria 10 requisições
  category = categories.sample

  car_brand = ['fiat', 'gm', 'vw', 'honda', 'renault', 'toyota'].sample
  computer_brand = ['lenovo', 'apple', 'acer', 'samsung', 'HP', 'dell'].sample
  cell_brand = ['samsung', 'apple', 'xiaomi', 'motorola', 'LG'].sample
  apparel_brand = ['YSL', 'hermes', 'gap', 'dior', 'prada', 'gucci', 'chanel'].sample
  moto_brand = ['honda', 'yamaha', 'bmw', 'triumph', 'ducatti', 'KTM'].sample
  utilitary_brand = ['ford', 'dodge', 'gm', 'mitsubishi', 'nissan'].sample
  toy_brand = ['estrela', 'hot wheels', 'fisher-price', 'chicco', 'playskool'].sample
  game_brand = ['playstation', 'xbox', 'nintendo', 'puzzle grow', 'wii'].sample
  accessory_brand = ['victoria secrets', 'colcci', 'YSL', 'louis vuitton'].sample
  eletronic_brand = ['sony', 'marantz', 'bose', 'pionner', 'aiwa'].sample

  if category == categories[0]
    brand = car_brand
  elsif category == categories[1]
    brand = computer_brand
  elsif category == categories[2]
    brand = cell_brand
  elsif category == categories[3]
    brand = apparel_brand
  elsif category == categories[4]
    brand = moto_brand
  elsif category == categories[5]
    brand = utilitary_brand
  elsif category == categories[6]
    brand = toy_brand
  elsif category == categories[7]
    brand = game_brand
  elsif category == categories[8]
    brand = accessory_brand
  elsif category == categories[9]
    brand = eletronic_brand
  end

  quant = rand(2..10)
  cat_id = categories.index(category) + 1
  request = Request.create(quantity: quant,
                           status: "Em análise",
                           description: "Nossa entidade precisa de #{quant} unidades de #{category.capitalize} da marca #{brand.capitalize}",
                           legal_framework: "Lei xxx de x/x/xxxx",
                           user_id: "#{number - 9}",
                           category_id: cat_id)
  # puts category
  # puts cat_id
  # puts request.description
  # puts request.category_id
  # puts request.user_id
  # puts cpf
  # puts cpf.class
  # puts cnpj
  number += 1
end

number = 0
while number < 100
  category = categories.sample
  rand_text = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
  quantity = rand(1..100)
  value = rand(100..10_000)
  status = ['disponível', 'esgotado', 'indisponível'].sample

  car_brand = ['fiat', 'gm', 'vw', 'honda', 'renault', 'toyota'].sample
  computer_brand = ['lenovo', 'apple', 'acer', 'samsung', 'HP', 'dell'].sample
  cell_brand = ['samsung', 'apple', 'xiaomi', 'motorola', 'LG'].sample
  apparel_brand = ['YSL', 'hermes', 'gap', 'dior', 'prada', 'gucci', 'chanel'].sample
  moto_brand = ['honda', 'yamaha', 'bmw', 'triumph', 'ducatti', 'KTM'].sample
  utilitary_brand = ['ford', 'dodge', 'gm', 'mitsubishi', 'nissan'].sample
  toy_brand = ['estrela', 'hot wheels', 'fisher-price', 'chicco', 'playskool'].sample
  game_brand = ['playstation', 'xbox', 'nintendo', 'puzzle grow', 'wii'].sample
  accessory_brand = ['victoria secrets', 'colcci', 'YSL', 'louis vuitton'].sample
  eletronic_brand = ['sony', 'marantz', 'bose', 'pionner', 'aiwa'].sample

  if category == categories[0]
    brand = car_brand
    catid = 1
    name = 'Carro'
  elsif category == categories[1]
    brand = computer_brand
    catid = 2
    name = 'Computador'
  elsif category == categories[2]
    brand = cell_brand
    catid = 3
    name = 'Celular'
  elsif category == categories[3]
    brand = apparel_brand
    catid = 4
    name = 'Acessório'
  elsif category == categories[4]
    brand = moto_brand
    catid = 5
    name = 'Motocicleta'
  elsif category == categories[5]
    brand = utilitary_brand
    catid = 6
    name = 'SUV'
  elsif category == categories[6]
    brand = toy_brand
    catid = 7
    name = 'Brinquedo'
  elsif category == categories[7]
    brand = game_brand
    catid = 8
    name = 'Jogo'
  elsif category == categories[8]
    brand = accessory_brand
    catid = 9
    name = 'Acessório'
  elsif category == categories[9]
    brand = eletronic_brand
    catid = 10
    name = 'Eletrônico'
  end

  product = Product.create(name: name.capitalize,
                         brand: brand.upcase,
                         description: "#{name} da #{brand.capitalize}",
                         address: "Av #{rand_text.reverse.upcase}, Numero 32#{number}",
                         quantity: quantity,
                         status: status.capitalize,
                         value: value,
                         category_id: catid)
  number += 1
end
