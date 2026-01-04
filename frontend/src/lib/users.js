import { apiFetch } from './api'

export function getAllUsersRelationships(id) {
    return apiFetch(`/api/user_relationship/${id}`);
}