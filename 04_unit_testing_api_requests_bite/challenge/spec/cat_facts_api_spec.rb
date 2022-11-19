require "cat_facts_api"

RSpec.describe CatFacts do
  it "provides a cat fact" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get).with(
      URI("https://catfact.ninja/fact")
      ).and_return('{"fact":"A cat has more bones than a human being; humans have 206 and the cat has 230 bones.","length":83}')
    cat_fact = CatFacts.new(fake_requester)
    expect(cat_fact.provide).to eq "Cat fact: A cat has more bones than a human being; humans have 206 and the cat has 230 bones."
  end
end