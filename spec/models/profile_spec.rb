require 'rails_helper'

RSpec.describe Profile, type: :model do
	describe ".by_initial" do
		subject { Profile.by_initial("S") }

		let(:sander) { create :profile, first_name: "Sander" }
		let(:stefan) { create :profile, first_name: "Stefan" }
		let(:wouter) { create :profile, first_name: "Wouter" }

		context "Matching letters" do
			it "returns the profiles that match the initial" do
				expect(subject).to match_array([stefan, sander])
			end

			it "is sorted on first_name" do
				expect(subject).to eq([sander, stefan])
			end
		end

		context "Non matching letters" do
			it "returns the profiles that NOT match the initial" do
				expect(subject).not_to eq([wouter])
			end
		end
	end
end
