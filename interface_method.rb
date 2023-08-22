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
    puts 'Введите своё имя:'
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
  end

  # Пропустить ход
  def skip_move
    puts 'Пропустил ход!'
  end

  # Добавить одну карту
  def add_one_card
    puts 'Добавил одну карту'
  end

  # Открыть карту
  def open_card
    @main_game.open_card
    continu_game?
  end

  # Хотите продолжить игру после того как открыли карты?
  def continu_game?
    puts 'Хотите продолжить игру(Y/n)?'
    console = gets.chomp
    console.downcase == 'y' ? @main_game.start_game : exit
  end
end
