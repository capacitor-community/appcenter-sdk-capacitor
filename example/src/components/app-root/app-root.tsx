import { Component, h } from '@stencil/core';
// import { AppCenter } from '@capacitor-community/appcenter-shared';

@Component({
  tag: 'app-root',
  styleUrl: 'app-root.css',
})
export class AppRoot {

  async componentWillLoad() {
    try{
      // await AppCenter.setUserId({ userId: "i_am_a_user"});
    } catch (e) {
      console.error(e);
    }
  }

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
