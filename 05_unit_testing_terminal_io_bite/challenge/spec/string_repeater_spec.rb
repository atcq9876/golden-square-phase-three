require "string_repeater"

RSpec.describe StringRepeater do
  it "repeats a string x number of times" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(terminal).to receive(:puts).with("Please enter a string")
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("10")
    expect(terminal).to receive(:puts).with("Here is your result:")
    expect(terminal).to receive(:puts).with("TWIX" * 10)

    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end

  it "fails if user doesn't enter number for 'repeats'" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(terminal).to receive(:puts).with("Please enter a string")
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("Test")

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.run }.to raise_error "'Repeats' must be a number"
  end
end