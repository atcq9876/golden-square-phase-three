require "interactive_calculator"

RSpec.describe InteractiveCalculator do
  it "substracts two numbers" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return(4).ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return(3).ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("4 - 3 = 1").ordered
    calculator = InteractiveCalculator.new(terminal)
    calculator.run
  end
end
