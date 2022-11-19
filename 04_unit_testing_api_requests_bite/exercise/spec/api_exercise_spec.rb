require "api_exercise"
require "date"
# require "json"

RSpec.describe TimeError do
  it "calculates delay of server time" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
      ).and_return('{"abbreviation":"GMT","client_ip":"2a00:23c4:8c92:cc01:a57b:dd76:3253:cd","datetime":"2022-11-19T14:13:05.699431+00:00","day_of_week":6,"day_of_year":323,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668867185,"utc_datetime":"2022-11-19T14:13:05.699431+00:00","utc_offset":"+00:00","week_number":46}')
    time_error = TimeError.new(fake_requester)
    time = Time.new(2022, 11, 19, 14, 13, 7)
    expect(time_error.error(time)).to eq -1.300569
  end
end