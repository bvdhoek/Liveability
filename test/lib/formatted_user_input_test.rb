require_relative '../test_helper'
require_relative '../../lib/formatted_user_input'

describe FormattedUserInput do
	let(:input) { "lala\n\nfoo\n\nbar" }
	let(:input_with_header) { "# lala\n\nfoo\n\nbar" }
	let(:input_with_subheader) { "## lala\n\nfoo\n\nbar" }
	let(:dashed_list) { "- lala\n- foo" }
	let(:ordered_list) { "1. lala\n2. foo" }

	it 'returns paragraphs' do
		output = FormattedUserInput.format input
		assert_equal '<p>lala</p><p>foo</p><p>bar</p>', output
	end

	it 'returns paragraph with header' do
		output = FormattedUserInput.format input_with_header
		assert_equal '<h1>lala</h1><p>foo</p><p>bar</p>', output
	end

	it 'returns paragraph with subheader' do
		output = FormattedUserInput.format input_with_subheader
		assert_equal '<h2>lala</h2><p>foo</p><p>bar</p>', output
	end

	it 'returns a list' do
		output = FormattedUserInput.format dashed_list
		assert_equal '<ul><li>lala</li><li>foo</li></ul>', output
	end

	it 'returns an ordered list' do
		output = FormattedUserInput.format ordered_list
		assert_equal '<ol><li>lala</li><li>foo</li></ol>', output
	end
end
