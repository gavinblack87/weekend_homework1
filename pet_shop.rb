def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, value)
  return pet_shop[:admin][:total_cash] += value
end

def pets_sold(number)
  return number[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, value)
  return pet_shop[:admin][:pets_sold] += value
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  breeds = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breeds << pet
    end
  end
  return breeds
end

def find_pet_by_name(pet_shop, name)
  for pets in pet_shop[:pets]
    if pets[:name] == name
      return  pets
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pets in shop[:pets]
    if pets[:name] == name
      shop[:pets].delete(pets)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
  return shop[:pets].count
end

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customers, cash)
  return customers[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

#MVP

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil || customer_can_afford_pet(customer, pet) == false
    return 
  else
    remove_customer_cash(customer, pet[:price])
    remove_pet_by_name(pet_shop, pet)
    add_pet_to_customer(customer, pet)
    add_or_remove_cash(pet_shop, pet[:price])
    increase_pets_sold(pet_shop, 1)
  end
end
