import { Component, h, Prop } from '@stencil/core';

export type ErrorReportItem = {
  label: string;
  value: string | number;
}

@Component({
  tag: 'error-report-items-modal',
  styleUrl: 'error-report-items-modal.css',
})
export class ErrorReportItemsModal {
  @Prop() items: ErrorReportItem[]

  render() {
    return [
      <ion-content>
        <ion-list>
          {this.items && this.items.map(item => (
            <ion-item>
              <ion-label class="ion-text-wrap">
                <h3>{item.label}</h3>
                <p>{item.value}</p>
              </ion-label>
            </ion-item>
          ))}
        </ion-list>
      </ion-content>
    ];
  }
}
