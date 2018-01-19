require "rails_helper"

describe Event, type: :model do
	describe "Validations" do
		let(:event1) { build(:event) }

		it "Not valid without name" do
			event1.name = ""

			event1.valid?
			expect(event1.errors.has_key?(:name)).to eq true
		end

		it "Not valid without description" do
			event1.description = ""

			event1.valid?
			expect(event1.errors.has_key?(:description)).to eq true
		end

		it "Not valid with description longer than 500 chars" do
			event1.description = "6" * 501

			event1.valid?
			expect(event1.errors.has_key?(:description)).to eq true
		end

		it "Not valid without starts_at" do
			event1.starts_at = ""

			event1.valid?
			expect(event1.errors.has_key?(:starts_at)).to eq true
		end

		it "Not valid without ends_at" do
			event1.ends_at = ""

			event1.valid?
			expect(event1.errors.has_key?(:ends_at)).to eq true
		end

		it "Not valid with starts_at in the past" do
			event1.starts_at = Date.today - 1.days

			event1.valid?
			expect(event1.errors.has_key?(:starts_at)).to eq true
		end

		it "Not valid with ends_at lesser than starts_at + 1 day" do
			event1.starts_at = Date.today
			event1.ends_at = event1.starts_at - 1.days
			event1.valid?
			expect(event1.errors.has_key?(:ends_at)).to eq true
		end
	end

	describe "#bargain?" do
		let(:bargain_event) { create :event, price: 20 }
		let(:non_bargain_event) { create :event, price: 200 }

		it "returns true if the price is smaller than 30 EUR" do
			expect(bargain_event.bargain?).to eq(true)
			expect(non_bargain_event.bargain?).to eq(false)
		end
	end

	describe ".order_by_price" do
		let!(:event1) { create :event, price: 100 }
		let!(:event2) { create :event, price: 200 }
		let!(:event3) { create :event, price: 50 }

		it "returns a sorted array of events by prices" do
			# note that they should not come out in the order that they were created
			expect(Event.order_by_price).to eq([event3, event1, event2])
		end
	end

	describe "association with user" do
		let(:user) { create :user }

		it "belongs to a user" do
			event = user.events.build(name: "Test Event")

			expect(event.user).to eq(user)
		end
	end

	describe "association with category" do
	  let(:event) { create :event }

	  let(:cat1) { create :category, name: "Hell Yea", events: [event] }
	  let(:cat2) { create :category, name: "All ages", events: [event] }
		let(:cat3) { create :category, name: "Cheeso Party", events: [event] }

	  it "has categories" do
	    expect(event.categories).to include(cat1)
	    expect(event.categories).to include(cat2)
	    expect(event.categories).to include(cat3)
	  end
	end

	describe "association with booking" do
	  let(:guest_user) { create :user, email: "guest@user.com" }
	  let(:host_user) { create :user, email: "host@user.com" }

	  let!(:event) { create :event, user: host_user }
	  let!(:registration) { create :registration, event: event, user: guest_user }

	  it "has guests" do
	    expect(event.registered_users).to include(guest_user)
	  end
	end
end
