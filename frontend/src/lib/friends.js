import { apiFetch } from './api'

export function sendFriendRequest(receiverId) {
  return apiFetch('/api/friend_requests', {
    method: 'POST',
    body: JSON.stringify({ receiver_id: receiverId })
  })
}

export function getFriendRequests() {
  return apiFetch('/api/friend_requests')
}

export function respondFriendRequest(id, status) {
  return apiFetch(`/api/friend_requests/${id}`, {
    method: 'PATCH',
    body: JSON.stringify({ status })
  })
}
