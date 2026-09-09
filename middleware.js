/**
 * Password-protect the entire deployment (mockup/staging).
 * Set in Vercel → Project → Settings → Environment Variables:
 *   BASIC_AUTH_USER
 *   BASIC_AUTH_PASSWORD
 */
export default function middleware(request) {
  const user = process.env.BASIC_AUTH_USER;
  const pass = process.env.BASIC_AUTH_PASSWORD;

  if (!user || !pass) {
    return new Response(
      'Mockup site is not configured. Set BASIC_AUTH_USER and BASIC_AUTH_PASSWORD in Vercel.',
      { status: 503, headers: { 'Content-Type': 'text/plain' } }
    );
  }

  const authHeader = request.headers.get('authorization');

  if (authHeader) {
    const [scheme, encoded] = authHeader.split(' ');
    if (scheme === 'Basic' && encoded) {
      const decoded = atob(encoded);
      const colon = decoded.indexOf(':');
      const username = decoded.slice(0, colon);
      const password = decoded.slice(colon + 1);

      if (username === user && password === pass) {
        return;
      }
    }
  }

  return new Response('Authentication required', {
    status: 401,
    headers: {
      'WWW-Authenticate': 'Basic realm="LSU CE Student Portal Mockups"',
      'Content-Type': 'text/plain',
    },
  });
}

export const config = {
  matcher: ['/((?!_vercel/.*).*)'],
};
