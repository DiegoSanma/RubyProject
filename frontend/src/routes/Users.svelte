<script>
  import { onMount } from 'svelte'
  import { apiFetch } from '../lib/api'
  import { sendFriendRequest } from '../lib/friends'

  let users = []

  onMount(async () => {
    const res = await apiFetch('/api/users')
    users = await res.json()
  })

  async function addFriend(id) {
    await sendFriendRequest(id)
    alert('Friend request sent')
  }
</script>

<h1>Users</h1>

<ul>
  {#each users as user}
    <li>
      {user.email}
      <button on:click={() => addFriend(user.id)}>
        Add friend
      </button>
    </li>
  {/each}
</ul>
