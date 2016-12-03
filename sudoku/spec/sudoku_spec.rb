require_relative '../sudoku'
  
describe "Sudoku" do
  let(:board) {"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  let(:sudoku_grid) {grid(board)}
  let(:solved_board) {"613487952492165387587932614154329768769851243328674195935218476271546839846793521"}

  it 'defines numbers' do
    expect(numbers).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'converts board string to array of 9 member arrays' do
    expect(sudoku_grid.first.length).to eq 9
  end

  it 'can generate horizontal scopes' do
    expect(columns(sudoku_grid).first).to eq [1, 0, 2, 0, 7, 0, 0, 4, 6]
  end

  it 'can generate vertical scopes' do
    expect(rows(sudoku_grid).first).to eq [1, 0, 5, 8, 0, 2, 0, 0, 0]
  end

  it 'can generate box scopes' do
    expect(boxes(sudoku_grid).first).to include [1, 0, 5, 0, 9, 0, 2, 0, 0]
  end

  it 'returns a solution' do
    expect(solve(board)).to be_a String
  end

  it 'can identify a valid solution' do
    expect(solved?(solved_board)).to be true
  end

  it 'has possibilities' do
    expect(possibilities(sudoku_grid)).to be_an Array
  end
end