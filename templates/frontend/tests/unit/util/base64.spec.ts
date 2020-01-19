import { decodeBase64Url } from '@/util/base64';

describe('util/base64.ts', () => {
  it('correctly decodes Base64Url data', () => {
    const expectedResult = 'Expected decoded data: Lorem ipsum dolor sit amet { "iss": 15, "exp": 33, "iat": 134134 }';
    const encoded = 'RXhwZWN0ZWQgZGVjb2RlZCBkYXRhOiBMb3JlbSBpcHN1bSBkb2xvciBzaXQgYW1ldCB7ICJpc3MiOiAxNSwgImV4cCI6IDMzLCAiaWF0IjogMTM0MTM0IH0';
    expect(decodeBase64Url(encoded)).toBe(expectedResult);
  });
});
