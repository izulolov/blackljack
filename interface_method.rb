require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'game'
require_relative 'player'
require_relative 'user'

class InterfaceMethod
  def initialize
    puts 'Добро пожаловать в игру Black Jack'
    puts '=' * 35
    @main_game = Game.new(user_name)
  end

  # Имя пользователя
  def user_name
    print 'Введите своё имя: '
    @user_name = gets.chomp.to_s
  end

  # Меню
  def menu
    puts
    puts 'Выберите действие: '
    puts '0 - Выход из игры: '
    puts '1 - Пропустить ход'
    puts '2 - Добавить карту'
    puts '3 - Открыть карты'
    puts
  end

  # Пропустить ход
  def skip_move
    @main_game.skip_move
  end

  # Добавить одну карту
  def add_one_card
    @main_game.add_one_card
  end

  # Открыть карту
  def open_card
    @main_game.open_card
    continu_game?
  end

  # Хотите продолжить игру после того как открыли карты?
  def continu_game?
    puts 'Хотите продолжить игру(Y-да/anykey для выхода)?'
    gets.chomp.downcase == 'y' ? @main_game.start_game : exit_game
  end

  def exit_game
    puts 'Выход из игры через 2 сек'
    if (100 - @main_game.user.balance).positive?
      puts "В ходе игры Вы проебали #{100 - @main_game.user.balance} рублей"
      puts "Ваш баланс #{@main_game.user.balance}"
    else
      puts "В ходе игры Вы выиграли #{(100 - @main_game.user.balance).abs} рублей"
      puts "Ваш баланс #{@main_game.user.balance}"
    end
    sleep(2)
    puts 'Игра завершена!'
    exit
  end
end
