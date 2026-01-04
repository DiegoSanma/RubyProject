<script>
  import { onMount } from 'svelte'
  import { sendFriendRequest } from '../lib/friends'
  import {apiFetch} from '../lib/api'
  import { getAllUsersRelationships } from '../lib/users'

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


<ul>
  {#each users as user}
    <li>
      {user.name}

      <button on:click={() => addFriend(user.id)}>
        Add friend
      </button>
    </li>
  {/each}
</ul>
