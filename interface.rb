require_relative 'interface_method'

class Interface

  def run
    interface_method_object = InterfaceMethod.new
    loop do
      interface_method_object.menu
      select = gets.chomp.to_i
      case select

      # Выход
      when 0
        puts 'Выход'
        break
      when 1
        interface_method_object.skip_move
      when 2
        interface_method_object.add_one_card
      when 3
        interface_method_object.open_card
      end
    end
  end
end
