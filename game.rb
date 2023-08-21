require_relative 'deck'
require_relative 'dealer'
require_relative 'user'

class Game
  attr_accessor :user, :dealer, :money, :deck, :players

  def initialize(user_name)
    #@money = 100
    @bet = 10
    @deck = Deck.new
    @user = User.new(user_name)
    @dealer = Dealer.new
    @players = [@user, @dealer]
    start_game
  end

  def status_bar
    "Баланс: #{@user.balance.zero? ? 0 : @user.balance} Ставка: #{@bet} Очки: #{@user.score}"
  end

  # Если игрок выбрал вариант продолжить игру
  # Надо сначала обновить их карты и очки, поэтому в player создали метод рефреш
  def start_game
    @user.refresh
    @dealer.refresh
    puts 'Раздача карт...'
    sleep(0.5)
    @user.balance -= 10
    @dealer.balance -= 10
    @players.each do |player|
      2.times do
        player.add_card(@deck.take_card)
      end
    end

    # После того как были сгенерированы карты для игроков вывести карты на консол
    # Естетвенно здесь карты диллера закрыты.
    show_info
  end

  # Метод открыть карты. Внутри этого метода вызывается метод lose?
  # То есть открыть карты вывести кто выиграл и добавить деньги на баланс победителя
  def open_card
    puts "Игрок: #{@user.name}:"
    puts @user.show_cards
    puts
    puts "Игрок: 'Dealer':"
    puts @dealer.show_cards
    puts
    puts show_result
    count_money
  end

  # Добваить мани к балансу игроку
  def take_money(player, money)
    player.balance += money
  end

  # После показа карт сделать расчет денег
  def count_money
    winner = lose?
    case winner
    when 'draw'
      take_money(@user, 10)
      take_money(@dealer, 10)
    when 'user'
      take_money(@user, 20) # 20 потом что он вернул с банк свои 10 и еще 10 дилера
    when 'dealer'
      take_money(@dealer, 20)
    end
  end

  # Кто проиграл, верней кто выиграл. Кто ближе всего к 21
  # Потом переделаю этот метод
  def lose?
    result = 'user' if (21 - @user.score < 21 - @dealer.score) && @user.score <= 21
    result = 'dealer' if (21 - @dealer.score < 21 - @user.score) && @dealer.score <= 21
    result = 'draw' if (@user.score == @dealer.score) && (@user.score <= 21 && dealer.score <= 21)
    result
    #@user.score > @dealer.score ? "Выиграл #{@user.name}" : "Выиграл #{@dealer.name}"
  end

  # После того как открыли карты показать результать
  def show_result
    return "Выиграл #{@user.name} - #{@user.score} очков" if lose? == 'user'
    return "Выиграл #{@dealer.name} - #{@dealer.score} очков" if lose? == 'dealer'
    return "Ничья! У обеих по #{@user.score} очков!" if lose? == 'draw'
  end

  # Из main перенес сюда.
  def show_info
    puts "Игрок: #{@user.name}. #{status_bar}"
    puts @user.show_cards
    puts
    puts "Игрок: 'Dealer'"
    puts @dealer.show_cards_close
  end
end

#gm = Game.new('Ikbol')

#gm.take_money(gm.user, 10)

#puts gm.user.balance
