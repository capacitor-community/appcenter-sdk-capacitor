import { Component, Host, h } from '@stencil/core';

@Component({
  tag: 'app-crashes',
  styleUrl: 'app-crashes.css',
  shadow: true,
})
export class AppCrashes {

  render() {
    return (
      <Host>
        <slot></slot>
      </Host>
    );
  }

}
