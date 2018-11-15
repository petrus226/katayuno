require 'rspec'

describe 'shiritori' do

    describe 'Player' do

      it 'knows who start to play' do

        expect(player_turn(players)).to eq("Paco")
      end

      it 'knows who is next' do
        array_turn = player_next(players)
        expect(player_turn(array_turn)).to eq("Pepe")
      end
    end

    it 'return the last letter' do
      new_word = "fino"
      last_letter = new_word[-1]

      result = last_letter(new_word)
      
      expect(result).to eq(last_letter)
    end

    it 'return the first letter' do

      expect(first_letter(word)).to eq("c")
    end

    def player_next(list)
      list.push(list.shift)

    end

    def player_turn(list)
      list[0]
    end


    def last_letter(word)
      word[word.length - 1]
    end

    def first_letter(word)
      word[0]
    end

    def players
      ["Paco", "Pepe"]
    end

    def word
      "charli"
    end
end
