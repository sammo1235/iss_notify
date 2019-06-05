RSpec.describe 'SpaceX API', type: :request do
  # initialize test data
  let!(:capsules) { create_list(:capsules, 10) }
  let(:capsules) { capsules.first.id }

  # Test suite for GET /todos
  describe 'GET /capsules' do
    # make HTTP get request before each example
    before { get '/capsules' }

    it 'returns capsules' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
