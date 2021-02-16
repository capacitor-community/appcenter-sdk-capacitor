import { Component, h } from '@stencil/core';

@Component({
  tag: 'app-root',
  styleUrl: 'app-root.css',
})
export class AppRoot {
  render() {
    return (
      <ion-app>
        <ion-router useHash={false}>
          <ion-route url="/" component="app-home" />
          <ion-route url="/analytics" component="app-analytics" />
          <ion-route url="/crashes" component="app-crashes" />
          <ion-route url="/other" component="app-other" />
        </ion-router>
        <ion-nav />
      </ion-app>
    );
  }
}
