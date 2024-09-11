# frozen_string_literal: true

require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#generate_secret_code' do
    it 'generates a code with 4 colors' do
      secret_code = game.generate_secret_code
      expect(secret_code.length).to eq(4)
    end

    it 'generates a code with valid colors' do
      secret_code = game.generate_secret_code
      expect(secret_code).to all(satisfy { |color| Game::COLORS.include?(color) })
    end
  end

  describe '#valid_input?' do
    it 'returns true for valid input' do
      valid_input = %i[red blue green yellow]
      expect(game.valid_input?(valid_input)).to be true
    end

    it 'returns false for invalid input' do
      invalid_input = %i[red blue green pink]
      expect(game.valid_input?(invalid_input)).to be false
    end

    it 'returns false for input with incorrect length' do
      invalid_input = %i[red blue green]
      expect(game.valid_input?(invalid_input)).to be false
    end
  end
end
