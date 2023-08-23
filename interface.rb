require_relative 'interface_method'

class Interface

  def run
    interface_method_object = InterfaceMethod.new
    loop do
      interface_method_object.menu
      print 'Введите цифру (0, 1, 2, 3): '
      select = gets.chomp.to_i
      puts
      case select

      # Выход
      when 0
        puts 'Выход'
        break
      # Пропустить ход
      when 1
        interface_method_object.skip_move
      # Добавить одну карту
      when 2
        interface_method_object.add_one_card
      # Открыть карту
      when 3
        interface_method_object.open_card
      else
        puts 'Надо было выбрать 0, 1, 2, 3'
      end
    end
  end
end
