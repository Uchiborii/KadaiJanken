class Player
  def hand
    puts “数字を入力してください”
    puts “０：グー, 1:チョキ , 2:パー”

    input_hand = gets.chomp # input_handに代入

    while true  #true だったら繰り返す
      if input_hand == "0" || input_hand == "1" || input_hand == "2"
      return input_hand.to_i # inputhand整数に変える

      else
      puts “０〜２の数字を入力してください”
      puts “0:グー, 1:チョキ, 2:パー”

    input_hand = gets.chomp
      end
    end
  end
end

class Enemy
def hand
    enemy_hand = rand(3)  #０以上３未満の範囲からランダムに整数を生成する
end
end

class Janken
  def pon(play_hand, enemy_hand)#playクラスのhandメソッド enemyメソッドの戻り値を引数に代入する
    janken = [“グー“, “チョキ“, “パー“] #変数jankenに“グー“, “チョキ“, “パー“代入
    puts “相手の手は#{janken[enemy_hand]}です。” #enemyクラスで帰ってきた整数をjankenに代入し“グー“, “チョキ“, “パー“の配列の文字列で表示する
    
  if player_hand == enemy_hand #player_hand == enemy_handでおなじだった場合あいこと表示する
    puts “あいこ”
    return true   #繰り返しじゃんけんを実行する
    
  elsif (player_hand == 0 && enemy_hand == 1) ||
        (player_hand == 1 && enemy_hand == 2) ||
        (player_hand == 2 && enemy_hand == 0)
    puts “あなたの勝ちです”
    return false #この条件だったら繰り返しを終わらせ、あなたの勝ちですと出力する　
    
  else
    puts “あなたの負けです”
    return false #それ以外だったら繰り返しを終わらせあなたの負けです出力する
    end
  end
end

class GameStart
    def self.jankenpon #selfで、GameStartをインスタンス化しなくてもjankenponメソッドを呼び出せる
    player = Player.new #player変数にPlayerクラスを代入してインスタンス化する
    enemy = Enemy.new
    janken = Janken.next_game

    next_game = true #next_game変数をtrueで初期化し、次のゲームが続行するかどうかを管理する
    while next_game #あいこだったらゲームを繰り返す
        next_game = janken.pon(player.hand, enemy.hand) #上で指定したクラス(janken,plyaer,enemy)の値を持ってきて実行する
    end
  end
end

GameStart.jankenpon #クラス名を使ってjankenponメソッドを呼び出して実行させる