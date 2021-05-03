const expect = require('expect')

const testValue = 1
describe('Run tests', () => {
  it('Should check something', () => {
    expect(testValue).toEqual(1)
  })
})