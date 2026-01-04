import { getToken } from './auth'

export async function apiFetch(url, options = {}) {
  const token = getToken()

  return fetch(url, {
    ...options,
    headers: {
      'Content-Type': 'application/json',
      ...(token && { Authorization: `Bearer ${token}` })
    }
  })
}

export async function getMyProfile(token) {
  const res = await fetch('api/me', {
    headers: {
      Authorization: `Bearer ${token}`
    }
  })

  if (!res.ok) throw new Error('No autorizado')
  return await res.json()
}