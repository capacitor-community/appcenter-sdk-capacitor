import { Component, h } from '@stencil/core';
// import AppCenter from '@capacitor-community/appcenter';

@Component({
  tag: 'app-root',
  styleUrl: 'app-root.css',
})
export class AppRoot {

  async componentWillLoad() {
    console.debug('[root] componentWillLoad')

    try{
      // await AppCenter.setUserId({ userId: "i_am_a_user"});
    } catch (e) {
      console.error(e);
    }
  }

  componentDidLoad() {
    console.debug('[root] componentDidLoad')
  }

  componentWillRender() {
    console.debug('[root] componentWillRender')
  }

  componentDidRender() {
    console.debug('[root] componentDidRender')
  }

  componentDidUpdate(){
    console.debug('[root] componentDidUpdate')
  }

  disconnectedCallback() {
    console.debug('[root] disconnectedCallback')
  }

  render() {
    return (
      <ion-app>
        <ion-router useHash={false}>
          <ion-route url="/" component="app-home" />
          <ion-route url="/analytics" component="app-analytics" />
          <ion-route url="/crashes" component="app-crashes" />
        </ion-router>
        <ion-nav />
      </ion-app>
    );
  }
}
