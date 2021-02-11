import { Component, Host, h } from '@stencil/core';

@Component({
  tag: 'app-other',
  styleUrl: 'app-other.css',
  shadow: true,
})
export class AppOther {

  render() {
    return (
      <Host>
        <slot></slot>
      </Host>
    );
  }

}
