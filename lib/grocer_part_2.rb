require_relative './part_1_solution.rb'

require 'pry'

def apply_coupons(cart, coupons)
  counter = 0 
  while counter < coupons.length do
    groc_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    coup_name = "#{coupons[counter][:item]} W/COUPON"
    coup_item = find_item_by_name_in_collection(coup_name, cart)
    if groc_item && groc_item[:count] >= coupons[counter][:num]
      if coup_item
        coup_item[:count] += coupons[counter][:num]
        groc_item[:count] -= coupons[counter][:num]
      else 
        coup_item = {
          :item => coup_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => groc_item[:clearance],
          :count => coupons[counter][:num]
        }
        cart << coup_item
        groc_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
  cart
end

def apply_clearance(cart)
  
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
