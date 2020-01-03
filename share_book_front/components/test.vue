<template>
  <div>
    Name: {{ fullName }}
    Message: {{ message }}
  </div>
</template>

<script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'

  interface User {
    firstName: string
    lastName: string
  }

  @Component
  export default class Test extends Vue {
    @Prop({ type: Object, required: true }) user!: User

    message: string = 'This is a message'

    get fullName (): string {
      return `${this.user.firstName} ${this.user.lastName}`
    }
  }
</script>

<style scoped>

</style>
